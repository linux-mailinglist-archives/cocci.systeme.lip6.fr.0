Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CBB2F491B
	for <lists+cocci@lfdr.de>; Wed, 13 Jan 2021 12:00:15 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10DAxE5u011752;
	Wed, 13 Jan 2021 11:59:14 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 945C277D9;
	Wed, 13 Jan 2021 11:59:14 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7CE0F7B6
 for <cocci@systeme.lip6.fr>; Wed, 13 Jan 2021 11:59:13 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10DAxDaE015043
 for <cocci@systeme.lip6.fr>; Wed, 13 Jan 2021 11:59:13 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,344,1602540000"; d="scan'208";a="486847577"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 11:58:41 +0100
Date: Wed, 13 Jan 2021 11:58:41 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Maxime Ripard <maxime@cerno.tech>
In-Reply-To: <20210113094839.n5uym2ymhhnykzzt@gilmour>
Message-ID: <alpine.DEB.2.22.394.2101131152470.2930@hadrien>
References: <20210113094839.n5uym2ymhhnykzzt@gilmour>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 13 Jan 2021 11:59:16 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 13 Jan 2021 11:59:13 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Performance issue with quite simple patch?
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr



On Wed, 13 Jan 2021, Maxime Ripard wrote:

> Hi!
>
> I've been trying to get a patch to rename any variable called "state" in
> a given set of callbacks.
>
> This is the patch that I've come up with:
>
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
>
> (
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_check = func,
> 	...,
>  };
> |
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_disable = func,
> 	...,
>  };
> |
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_update = func,
> 	...,
>  };
> )

You don't need the ...s in the above.  For structure declarations
Coccinelle is happy as long as what you specify is a subset of what is
present.  The static and const aren't essential either.  If you remove
them, the pattern will match whethe thy are present or not.

>
> @@
> identifier plane_atomic_func.func;
> symbol state;
> expression e;
> type T;
> @@
>
>  func(...)
>  {
>  	...
> -	T state = e;
> +	T plane_state = e;
>  	<+...
> -	state
> +	plane_state
>  	...+>
>  }
>
> However, it seems like at least on a file (in Linux,
> drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c), it takes quite big
> performance hit with one CPU running at 100% until the timeout is hit.
>
> Replacing <+... by ... makes it work instantly, but doesn't really do
> what I'm expecting, so I guess it's a matter of the patch being
> subobtimal?
>
> Is there a more optimal way of doing it?

In your rule, I donkt think that there is really any essential connection
between the declaration and the use?  You just want to change state to
plane_state when it occurs in one of the functions that you detected.  So
you could at least try the following and see if it gives any false
positives:

@@
identifier plane_atomic_func.func;
symbol state;
expression e;
type T;
@@

 func(...)
 {
      <...
(
-     T state = e;
+     T plane_state = e;
|
-     state
+     plane_state
)
      ...>
 }
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

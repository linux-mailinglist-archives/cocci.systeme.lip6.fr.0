Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C68A0D48CC
	for <lists+cocci@lfdr.de>; Fri, 11 Oct 2019 22:01:38 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9BK0sjh011147;
	Fri, 11 Oct 2019 22:00:54 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id DD3E977C0;
	Fri, 11 Oct 2019 22:00:53 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 44FE677AE
 for <cocci@systeme.lip6.fr>; Fri, 11 Oct 2019 22:00:52 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9BK0pVW016322
 for <cocci@systeme.lip6.fr>; Fri, 11 Oct 2019 22:00:51 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.67,285,1566856800"; d="scan'208";a="322452248"
Received: from 81-65-53-202.rev.numericable.fr (HELO hadrien) ([81.65.53.202])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Oct 2019 22:00:51 +0200
Date: Fri, 11 Oct 2019 22:00:51 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: =?ISO-8859-15?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <56e7bd73-5b50-ddeb-9a56-62daf93eb015@suse.com>
Message-ID: <alpine.DEB.2.21.1910112200230.3284@hadrien>
References: <56e7bd73-5b50-ddeb-9a56-62daf93eb015@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-57125335-1570824051=:3284"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 11 Oct 2019 22:00:54 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Fri, 11 Oct 2019 22:00:52 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] macro parameters and expressions?
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-57125335-1570824051=:3284
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT



On Fri, 11 Oct 2019, Jürgen Groß wrote:

> Hi,
>
> I have a simple semantic patch:
>
>   virtual patch
>
>   @@
>   expression buf, val;
>   @@
>   - snprintf(buf, PAGE_SIZE, "%d\n", val)
>   + spgprintf_d(buf, val)
>
> This works nearly always as expected, but not in some macros. The cases
> where it is not working are those when "val" is using a parameter of the
> macro, e.g.:
>
>   #define MACRO(name)    snprintf(pg, PAGE_SIZE, %u\n", ptr->name)
>
> Is that on purpose? If yes, how can this be avoided?

I don't think it should be on purpose.  Could you send some C code that
illustrates the problem?

thanks,
julia
--8323329-57125335-1570824051=:3284
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-57125335-1570824051=:3284--

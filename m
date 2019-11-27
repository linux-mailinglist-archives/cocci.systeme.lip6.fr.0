Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F1A10B860
	for <lists+cocci@lfdr.de>; Wed, 27 Nov 2019 21:43:04 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xARKgr2S015828;
	Wed, 27 Nov 2019 21:42:53 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B378577DF;
	Wed, 27 Nov 2019 21:42:53 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E50A477D2
 for <cocci@systeme.lip6.fr>; Wed, 27 Nov 2019 21:42:51 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xARKgn8s012797
 for <cocci@systeme.lip6.fr>; Wed, 27 Nov 2019 21:42:49 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,250,1571695200"; d="scan'208";a="328269428"
Received: from abo-228-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.228])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 21:42:49 +0100
Date: Wed, 27 Nov 2019 21:42:48 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Derek M Jones <derek@knosof.co.uk>
In-Reply-To: <9481f942-7740-502a-e3a1-4bbe63740b54@knosof.co.uk>
Message-ID: <alpine.DEB.2.21.1911272140120.2559@hadrien>
References: <9481f942-7740-502a-e3a1-4bbe63740b54@knosof.co.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 27 Nov 2019 21:42:53 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 27 Nov 2019 21:42:49 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Coccinelle has some competition
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



--- Please note the new email address ---


On Wed, 27 Nov 2019, Derek M Jones wrote:

> All,
>
> Coccinelle has some competition:
> https://comby.dev/
>
> The market must be hotting up.
>
> Will we be seeing Julia making IPO plans ;-)

I believe that it is based on this paper (same person, same [] notation
for metavariables):

Rijnard van Tonder, Claire Le Goues:
Lightweight multi-language syntax transformation with parser parser
combinators. PLDI 2019: 363-378

The most obvious difference is that as far as I can see there is no ...
On the other hand, it is multi-language.

julia


>
> --
> Derek M. Jones           Software analysis
> tel: +44 (0)1252 520667  blog:shape-of-code.coding-guidelines.com
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

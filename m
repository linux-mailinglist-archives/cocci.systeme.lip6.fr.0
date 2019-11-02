Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C2FECDA0
	for <lists+cocci@lfdr.de>; Sat,  2 Nov 2019 07:41:13 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA26ejkv028069;
	Sat, 2 Nov 2019 07:40:45 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B654177D2;
	Sat,  2 Nov 2019 07:40:45 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 648AA61B4
 for <cocci@systeme.lip6.fr>; Sat,  2 Nov 2019 07:40:43 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA26egUO016442
 for <cocci@systeme.lip6.fr>; Sat, 2 Nov 2019 07:40:42 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,258,1569276000"; d="scan'208";a="409967241"
Received: from abo-45-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.45])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Nov 2019 07:40:42 +0100
Date: Sat, 2 Nov 2019 07:40:42 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: =?ISO-8859-2?Q?Ond=F8ej_Sur=FD?= <ondrej@sury.org>
In-Reply-To: <07F58C35-52CF-4DA3-A9A7-62B2A82A8B2D@sury.org>
Message-ID: <alpine.DEB.2.21.1911020739360.3254@hadrien>
References: <D63C6B6A-C481-4A09-8EFF-D2760E9B85A8@sury.org>
 <alpine.DEB.2.21.1911012003140.2883@hadrien>
 <07F58C35-52CF-4DA3-A9A7-62B2A82A8B2D@sury.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1708915813-1572676842=:3254"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 02 Nov 2019 07:40:48 +0100 (CET)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Sat, 02 Nov 2019 07:40:42 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Detecting functions with dummy return value
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

--8323329-1708915813-1572676842=:3254
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 1 Nov 2019, Ondřej Surý wrote:

> Hi Julia,
>
> thanks for the quick response.
>
> > On 1 Nov 2019, at 14:09, Julia Lawall <julia.lawall@lip6.fr> wrote:
> >
> > This is not possible.  ... describes control-flow paths.  Nothing happens
> > after a return.  Your attempt above would match functions where all
> > control-flow paths end with return (ISC_R_SUCCESS);, even if some of those
> > returns are in if branches.
>
> I think that would be still fine, I mostly want the Coccinelle to select the functions
> that need my attention and we also use Coccinelle in our CI pipelines, so we don’t
> reintroduce the code we already cleaned up.
>
> So, if I could just mark the functions that *only* return ISC_R_SUCCESS anywhere,
> it would be enough for my use case.  I would then go through the results by hand
> and write a targeted spatch for every selected function.  That’s fine, even though
> Coccinelle feels like a magic wand, I don’t expect it to be one.
>
> The spatch you sent ends up with:
>
> minus: parse error:
>   File "cocci/dummy.spatch", line 7, column 0, charpos = 50
>   around = 'foo',
>   whole content = foo(...) {

Sorry, you also need:

typedef isc_result_t;

in the metavariable list.

>
> BTW Coccinelle is such a great tool, it has helped with BIND 9
> refactoring so much, so thank you for working on that!

Nice to hear :) Thanks.

julia
--8323329-1708915813-1572676842=:3254
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1708915813-1572676842=:3254--

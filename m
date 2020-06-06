Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7DD1F08D3
	for <lists+cocci@lfdr.de>; Sat,  6 Jun 2020 22:50:42 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 056KoR5x024742;
	Sat, 6 Jun 2020 22:50:27 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 6B5D9777D;
	Sat,  6 Jun 2020 22:50:27 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7FCCA3BAB
 for <cocci@systeme.lip6.fr>; Sat,  6 Jun 2020 22:50:25 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 056KoP27002108
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sat, 6 Jun 2020 22:50:25 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,481,1583190000"; d="scan'208";a="453335185"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2020 22:50:08 +0200
Date: Sat, 6 Jun 2020 22:50:08 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <6f83e89b-f261-5251-19f8-4ba52ef0e6f4@linux.com>
Message-ID: <alpine.DEB.2.21.2006062249170.2578@hadrien>
References: <20200530205348.5812-1-efremov@linux.com>
 <20200530205348.5812-2-efremov@linux.com>
 <alpine.DEB.2.21.2006061024100.2578@hadrien>
 <6f83e89b-f261-5251-19f8-4ba52ef0e6f4@linux.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 06 Jun 2020 22:50:27 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 06 Jun 2020 22:50:25 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Joe Perches <joe@perches.com>, cocci@systeme.lip6.fr,
        linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH 1/2] Coccinelle: extend memdup_user
 transformation with GFP_USER
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



On Sat, 6 Jun 2020, Denis Efremov wrote:

>
>
> On 6/6/20 11:24 AM, Julia Lawall wrote:
> >
> >
> > On Sat, 30 May 2020, Denis Efremov wrote:
> >
> >> Match GFP_USER allocations with memdup_user.cocci rule.
> >> Commit 6c2c97a24f09 ("memdup_user(): switch to GFP_USER") switched
> >> memdup_user() from GFP_KERNEL to GFP_USER. In most cases it is still
> >> a good idea to use memdup_user() for GFP_KERNEL allocations. The
> >> motivation behind altering memdup_user() to GFP_USER is here:
> >> https://lkml.org/lkml/2018/1/6/333
> >
> > Should the rule somehow document the cases in which memdup_user should now
> > not be used?
> >
> > julia
> >
> >
> >>
> >> Signed-off-by: Denis Efremov <efremov@linux.com>
> >> ---
> >>  scripts/coccinelle/api/memdup_user.cocci | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/scripts/coccinelle/api/memdup_user.cocci b/scripts/coccinelle/api/memdup_user.cocci
> >> index c809ab10bbce..49f487e6a5c8 100644
> >> --- a/scripts/coccinelle/api/memdup_user.cocci
> >> +++ b/scripts/coccinelle/api/memdup_user.cocci
> >> @@ -20,7 +20,7 @@ expression from,to,size;
> >>  identifier l1,l2;
> >>  @@
> >>
> >> --  to = \(kmalloc\|kzalloc\)(size,GFP_KERNEL);
> >> +-  to = \(kmalloc\|kzalloc\)(size,\(GFP_KERNEL\|GFP_USER\));
>
> Actually, we can add optional __GFP_NOWARN here to match such cases as:
> GFP_KERNEL | __GFP_NOWARN
>
> However, I don't know how to express it in elegant way. Something like?
> (
> -  to = \(kmalloc\|kzalloc\)(size,\(GFP_KERNEL\|GFP_USER\));
> |
> -  to = \(kmalloc\|kzalloc\)(size, GFP_KERNEL|__GFP_NOWARN);
> |
> -  to = \(kmalloc\|kzalloc\)(size, GFP_USER|__GFP_NOWARN);
> )

I guess you could do:

\(GFP_KERNEL\|GFP_USER\|\(GFP_KERNEL\|GFP_USER\)|__GFP_NOWARN\)

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3196D1F5753
	for <lists+cocci@lfdr.de>; Wed, 10 Jun 2020 17:09:35 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05AF9J8O011030;
	Wed, 10 Jun 2020 17:09:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E0D7C7827;
	Wed, 10 Jun 2020 17:09:18 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E2E073BAB
 for <cocci@systeme.lip6.fr>; Wed, 10 Jun 2020 17:09:16 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05AF9FxH026979
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 10 Jun 2020 17:09:15 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,496,1583190000"; d="scan'208";a="351224050"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 17:09:15 +0200
Date: Wed, 10 Jun 2020 17:09:15 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <4befcdd7-5c9c-ebfe-7c2b-f493c8c2cbc8@web.de>
Message-ID: <alpine.DEB.2.21.2006101708580.2235@hadrien>
References: <88d56de0-0a22-3371-ebd9-0ccbbc81f76e@web.de>
 <alpine.DEB.2.21.2006091952570.2516@hadrien>
 <5156fabe-d9c0-def9-cd8c-d85b8b5c704f@web.de>
 <alpine.DEB.2.21.2006101653030.2235@hadrien>
 <4befcdd7-5c9c-ebfe-7c2b-f493c8c2cbc8@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-994800300-1591801755=:2235"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 10 Jun 2020 17:09:19 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 10 Jun 2020 17:09:15 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking software behaviour according to selected SmPL
 code variants
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

--8323329-994800300-1591801755=:2235
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Wed, 10 Jun 2020, Markus Elfring wrote:

> >> @display@
> >> expression e;
> >> @@
> >> *brelse(e);
> >>  <+... when != e = ...
> >> *e
> >>  ...+>
> …
> >> elfring@Sonne:~/Projekte/Linux/next-patched> spatch ~/Projekte/Coccinelle/janitor/show_questionable_brelse_usage8.cocci fs/ext4/extents.c
> >> …
> >> @@ -1127,8 +1121,6 @@ static int ext4_ext_split(handle_t *hand
> …
> >> -	brelse(bh);
> >> -	bh = NULL;
> …
> >> Would you like to suggest any fine-tuning for the search approach?
> >
> > When describes what happens elsewhere than in the statement matched by the pattern.
>
> I hoped that my specification of a SmPL code exclusion should prevent
> the presentation of assignments (independent from statements and/or expressions).

(
e = e1
|
*e
)
--8323329-994800300-1591801755=:2235
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-994800300-1591801755=:2235--

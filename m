Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9A8235963
	for <lists+cocci@lfdr.de>; Sun,  2 Aug 2020 19:01:20 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 072H11aq009135;
	Sun, 2 Aug 2020 19:01:01 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 59C3177BC;
	Sun,  2 Aug 2020 19:01:01 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 336B34084
 for <cocci@systeme.lip6.fr>; Sun,  2 Aug 2020 19:00:59 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 072H0wjb013372
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 2 Aug 2020 19:00:58 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,427,1589234400"; d="scan'208";a="355809314"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 19:00:58 +0200
Date: Sun, 2 Aug 2020 19:00:57 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <74a5a472-4431-46e7-bd8b-95886f031c93@web.de>
Message-ID: <alpine.DEB.2.22.394.2008021859010.2531@hadrien>
References: <e4f3c4e8-03e8-dbc2-5871-0d111b3086a4@web.de>
 <alpine.DEB.2.22.394.2008020904310.2531@hadrien>
 <eead5e2a-da8d-83cd-eeb4-f193702b800f@web.de>
 <alpine.DEB.2.22.394.2008021348430.2531@hadrien>
 <82af6b44-ea09-b86f-81f7-e96e8594a31d@web.de>
 <alpine.DEB.2.22.394.2008021513010.2531@hadrien>
 <065fee88-5206-5d9b-c83c-4e6a20aefd85@web.de>
 <alpine.DEB.2.22.394.2008021632210.2531@hadrien>
 <8f357aa0-7811-a5b8-a061-814899654e88@web.de>
 <alpine.DEB.2.22.394.2008021733340.2531@hadrien>
 <c1822815-456f-316d-93b5-88beb55a0d69@web.de>
 <alpine.DEB.2.22.394.2008021814220.2531@hadrien>
 <74a5a472-4431-46e7-bd8b-95886f031c93@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-969215443-1596387658=:2531"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 02 Aug 2020 19:01:02 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 02 Aug 2020 19:00:58 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] [00/43] cocci: Add support for meta attributes to SmPL
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

--8323329-969215443-1596387658=:2531
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sun, 2 Aug 2020, Markus Elfring wrote:

> >> How do you distinguish between metavariables and other SmPL variables then?
> >
> > Metavariables don't have "name" in their declaration.  There is a sentence
> > about that in the documentation.
> >
> > The {\bf name} modifier specifies that instead of declaring a metavariable
> > to match over some kind, the identifiers are to be considered as elements
> > of that kind when they appear in the code.
>
> See also:
> https://github.com/coccinelle/coccinelle/blob/e06b9156dfa02a28cf3cbf0913a10513f3d163ab/docs/manual/cocci_syntax.tex#L458
>
>
> > "instead of declaring a metavariable" says that the thing that is declared
> > is not a metavariable.
>
> It seems that we stumble on different interpretations also around a wording
> like “to match over some kind”.
>
> * Which is the category of SmPL identifiers which contain the key word “name”
>   in their data type (or “kind” if you would like to prevent to denote them
>   as metavariables)?

The ones that have "name" in the BNF.

>
> * How do you think about to add square brackets to a line in the TeX SmPL grammar?
>   https://github.com/coccinelle/coccinelle/blob/e06b9156dfa02a28cf3cbf0913a10513f3d163ab/docs/manual/cocci_syntax.tex#L245
>
>   \CASE{attribute \opt{name} \NT{ids} ;}

No, there will be a separate entry for attribute name;.  Putting \opt{}
would lead to the confusion that you are falling into.  They are different
things.

>
> >> Should software users get informed about unused items in consistent ways?
> >> https://github.com/coccinelle/coccinelle/blob/04f36d537b9f6c0c127d05184cccd21f1a46b952/parsing_cocci/check_meta.ml#L711
>
> Do you care if a SmPL name variable would accidentally not be used
> (like in the script “https://github.com/coccinelle/coccinelle/blob/04f36d537b9f6c0c127d05184cccd21f1a46b952/tests/metaattr.cocci#L2”)?

It actually is used, to help parsing the .c file.  This information will
be added to the documentation shortly.

julia
--8323329-969215443-1596387658=:2531
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-969215443-1596387658=:2531--

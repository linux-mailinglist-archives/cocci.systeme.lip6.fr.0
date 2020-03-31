Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E8D198A75
	for <lists+cocci@lfdr.de>; Tue, 31 Mar 2020 05:24:42 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02V3OChg019455;
	Tue, 31 Mar 2020 05:24:12 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2DB587822;
	Tue, 31 Mar 2020 05:24:12 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from osiris.lip6.fr (osiris.lip6.fr [132.227.60.30])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 97E0D7809
 for <cocci@systeme.lip6.fr>; Tue, 31 Mar 2020 05:24:09 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0122.hostedemail.com
 [216.40.44.122])
 by osiris.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02V3O62n016765
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Tue, 31 Mar 2020 05:24:07 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 6844E18002271
 for <cocci@systeme.lip6.fr>; Tue, 31 Mar 2020 00:54:21 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 634E418034A68;
 Tue, 31 Mar 2020 00:54:17 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:988:989:1260:1277:1311:1313:1314:1345:1437:1515:1516:1518:1534:1538:1568:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3865:3866:3867:3870:3871:3874:4605:5007:9121:10004:10400:11658:11914:12297:12760:13019:13069:13161:13229:13311:13357:13439:14659:14721:21080:21324:21627:30054,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: toe15_842d10d1bf51
X-Filterd-Recvd-Size: 1112
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Tue, 31 Mar 2020 00:54:16 +0000 (UTC)
Message-ID: <f8581a548767a5d7e460816f125566fca8694aa0.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 30 Mar 2020 17:52:21 -0700
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 31 Mar 2020 05:24:14 +0200 (CEST)
X-Greylist: Delayed for 02:20:00 by milter-greylist-4.4.3 (osiris.lip6.fr
 [132.227.60.30]); Tue, 31 Mar 2020 05:24:07 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.30
Cc: cocci <cocci@systeme.lip6.fr>
Subject: [Cocci] linux: bad logic in repetitive tests
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

There is a block of if tests against the same variable
in include/linux/mtd/pfow.h that likely is defective

        if (prog_status & 0x3)
                ...
        else if (prog_status & 0x2)
                ...
        else (prog_status & 0x1)
                ...

If the first test is true the subsequent 2 tests aren't
possible.

Likely the first test should be something like

	if ((prog_status & 0x03) == 0x03)

Is there a way for cocci to find this style of bitwise
logic defect?



_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

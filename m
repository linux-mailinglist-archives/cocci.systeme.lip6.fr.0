Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AB110B17B
	for <lists+cocci@lfdr.de>; Wed, 27 Nov 2019 15:37:03 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAREYcuD013018;
	Wed, 27 Nov 2019 15:34:38 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A6AF577DF;
	Wed, 27 Nov 2019 15:34:38 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0BD4E77D2
 for <cocci@systeme.lip6.fr>; Wed, 27 Nov 2019 15:34:36 +0100 (CET)
Received: from know-smtprelay-omc-6.server.virginmedia.net
 (know-smtprelay-omc-6.server.virginmedia.net [80.0.253.70])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAREYYsU011017
 for <cocci@systeme.lip6.fr>; Wed, 27 Nov 2019 15:34:34 +0100 (CET)
Received: from [192.168.1.201] ([82.2.1.89]) by cmsmtp with ESMTPA
 id ZyOniUDlhwdwAZyOoiVtCm; Wed, 27 Nov 2019 14:34:34 +0000
X-Originating-IP: [82.2.1.89]
X-Authenticated-User: dmjones@ntlworld.com
X-Spam: 0
X-Authority: v=2.3 cv=f85m+t6M c=1 sm=1 tr=0 a=WPUjqzW0G8tv1tco57yGEQ==:117
 a=WPUjqzW0G8tv1tco57yGEQ==:17 a=IkcTkHD0fZMA:10 a=P_6feOwDAAAA:8
 a=pxdNzhGcAAAA:8 a=wKC-sUEZuKkF5-w_Kl4A:9 a=QEXdDO2ut3YA:10 a=VxAk22fqlfwA:10
 a=F0XCbrXZiZCSCgNq0P85:22 a=6UCLHkHsjq5DW36378aM:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=SsAZrZ5W_gNWK9tOzrEV:22
To: cocci@systeme.lip6.fr
From: Derek M Jones <derek@knosof.co.uk>
Organization: Knowledge Software, Ltd
Message-ID: <9481f942-7740-502a-e3a1-4bbe63740b54@knosof.co.uk>
Date: Wed, 27 Nov 2019 14:34:32 +0000
User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:52.0) Gecko/20100101
 Thunderbird/52.9.0
MIME-Version: 1.0
Content-Language: en-US
X-CMAE-Envelope: MS4wfEZJllwd/3GIgb2GcJirhlE9eJ7mqaIFYgmIJyODSCGnR5nBxaa21O2wTmBbCI6a2BwOu63AYQi6uq957eHjexLwowt7vRZj8zMvBxHwNdmipJ83LbSU
 icXISDWCHpjansOymiv96SPQExPAG4D9oWoW2fLIpz3lTz6487VUGv+f
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 27 Nov 2019 15:34:40 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 27 Nov 2019 15:34:35 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] Coccinelle has some competition
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

All,

Coccinelle has some competition:
https://comby.dev/

The market must be hotting up.

Will we be seeing Julia making IPO plans ;-)

-- 
Derek M. Jones           Software analysis
tel: +44 (0)1252 520667  blog:shape-of-code.coding-guidelines.com
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
